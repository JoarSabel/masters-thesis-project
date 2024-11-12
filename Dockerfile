FROM jupyter/minimal-notebook:latest

# Install Poetry
RUN pip install poetry

# Set Poetry environment variables
ENV POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VERSION=1.14.7

# Copy project files
COPY .env pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry install --no-interaction --no-ansi

# Set working directory
WORKDIR /master-thesis-project

# Run Jupyter Notebook
CMD ["poetry", "run" , "jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
