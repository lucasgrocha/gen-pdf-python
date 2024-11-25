from jinja2 import Environment, FileSystemLoader
import pdfkit  # Wrapper for wkhtmltopdf
from models import Funcionario, Cargo, Endereco, session

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

# Save the rendered HTML to a file
with open("tmp/dados.html", "w", encoding="utf-8") as file:
    file.write(html_content)

print("HTML file generated: dados.html")

# PDF generation options
pdf_options = {
    "page-size": "A4",
    "encoding": "UTF-8",
    "margin-top": "10mm",
    "margin-right": "10mm",
    "margin-bottom": "10mm",
    "margin-left": "10mm",
}

# Generate PDF from the rendered HTML
pdfkit.from_file("tmp/dados.html", "tmp/dados.pdf", options=pdf_options)

print("PDF file generated: dados.pdf")

# Close the session
session.close()
