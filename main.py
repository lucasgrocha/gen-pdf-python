import mysql.connector
from jinja2 import Environment, FileSystemLoader
import pdfkit  # Wrapper for wkhtmltopdf

# Database connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # Add your database password if required
    database="EMPRESA"
)
cursor = conn.cursor()

# Fetch data from the database
cursor.execute("SELECT * FROM FUNCIONARIO;")
funcionarios = cursor.fetchall()

cursor.execute("SELECT * FROM ENDERECO;")
enderecos = cursor.fetchall()

cursor.execute("SELECT * FROM CARGO;")
cargos = cursor.fetchall()

cursor.close()
conn.close()

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
