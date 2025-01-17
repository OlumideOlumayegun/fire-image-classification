FROM python:3.10-slim-bullseye

RUN apt-get update && \
    apt-get upgrade --yes

#RUN useradd --create-home imageauth

#USER imageauth

WORKDIR /home/fire

ENV VIRTUALENV=/home/fire/venv

RUN python3 -m venv $VIRTUALENV

ENV PATH="$VIRTUALENV/bin:$PATH"

COPY . .

#COPY --chown=imageauth pyproject.toml requirements.txt ./ 

#COPY --chown=imageauth config logs model ./

#COPY --chown=imageauth templates params.yaml ./

#COPY --chown=imageauth src ./

#COPY --chown=imageauth app.py main.py dvc.yaml README.md ./

RUN python -m pip install --upgrade pip setuptools

#RUN python -m pip install -r requirements.txt

#RUN python -m pip install --no-cache-dir -r requirements.txt

RUN python -m pip install -c constraints.txt .

CMD ["python3", "src\fire_image_classifier\app.py"]