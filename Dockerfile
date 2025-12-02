FROM ghcr.io/dbt-labs/dbt-core:latest

WORKDIR /dbt_pj

COPY scripts/batch.sh ./scripts/batch.sh
COPY dbt ./dbt
COPY .env ./

WORKDIR /dbt_pj/dbt

RUN pip install dbt-bigquery

# 元にしているイメージでENTRYPOINTが設定されているので上書き
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "../scripts/batch.sh" ]