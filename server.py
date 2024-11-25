from fastapi import FastAPI, HTTPException
from fastapi.responses import Response
from jinja2 import Environment, FileSystemLoader
import pdfkit  # Wrapper for wkhtmltopdf
from models import Funcionario, Cargo, Endereco, session

app = FastAPI()

@app.get("/render-pdf")
def render_pdf():
    try:
        # Fetch data from the database using SQLAlchemy ORM
        funcionarios = session.query(Funcionario).all()
        enderecos = session.query(Endereco).all()
        cargos = session.query(Cargo).all()

        # Jinja2 template rendering
        env = Environment(loader=FileSystemLoader('.'))
        template = env.get_template("template.html")

        # Render the template with data
        html_content = template.render(
            funcionarios=funcionarios,
            enderecos=enderecos,
            cargos=cargos
        )

        # PDF generation options
        pdf_options = {
            "page-size": "A4",
            "encoding": "UTF-8",
            "margin-top": "10mm",
            "margin-right": "10mm",
            "margin-bottom": "10mm",
            "margin-left": "10mm",
        }

        # Generate PDF as binary content
        pdf_content = pdfkit.from_string(html_content, False, options=pdf_options)

        # Return the PDF content as a response with proper headers
        return Response(
            content=pdf_content,
            media_type="application/pdf",
            headers={"Content-Disposition": "inline; filename=dados.pdf"}
        )
    except Exception as e:
        session.close()
        raise HTTPException(status_code=500, detail=f"Error generating PDF: {str(e)}")
    finally:
        # Close the session
        session.close()
