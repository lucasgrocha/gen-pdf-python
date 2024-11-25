from sqlalchemy import create_engine, Column, Integer, String, Date
from sqlalchemy.types import DECIMAL  # Correct import for Decimal type
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Create base class for the models
Base = declarative_base()

class Funcionario(Base):
    __tablename__ = 'FUNCIONARIO'

    party_id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(100), nullable=False)
    last_name = Column(String(100), nullable=False)
    birthday = Column(Date, nullable=False)
    nome_mae = Column(String(100), nullable=True)
    nome_pai = Column(String(100), nullable=True)

    def __repr__(self):
        return f"<Funcionario(party_id={self.party_id}, first_name={self.first_name}, last_name={self.last_name})>"

class Cargo(Base):
    __tablename__ = 'CARGO'

    id = Column(Integer, primary_key=True, autoincrement=True)
    party_id = Column(Integer, nullable=False)
    cargo = Column(String(100), nullable=False)
    salario = Column(DECIMAL(10, 2), nullable=False)  # Use DECIMAL here

    def __repr__(self):
        return f"<Cargo(id={self.id}, cargo={self.cargo}, salario={self.salario})>"

class Endereco(Base):
    __tablename__ = 'ENDERECO'

    id = Column(Integer, primary_key=True, autoincrement=True)
    party_id = Column(Integer, nullable=False)
    rua = Column(String(200), nullable=False)
    bairro = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    cep = Column(String(10), nullable=False)
    cidade = Column(String(100), nullable=False)
    estado = Column(String(50), nullable=False)
    pais = Column(String(50), nullable=False)

    def __repr__(self):
        return f"<Endereco(id={self.id}, rua={self.rua}, cidade={self.cidade})>"

# Database connection setup
DATABASE_URL = "mysql+mysqlconnector://root:@localhost/EMPRESA?charset=utf8mb4"
engine = create_engine(DATABASE_URL)

# Create tables if they don't exist
Base.metadata.create_all(engine)

# Session setup
Session = sessionmaker(bind=engine)
session = Session()
