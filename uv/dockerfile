FROM dhi.io/rust:1.99.1-debian13-dev@sha256:be6c6ec91c61ae15b80521052df1c7f60fefd303293563b3dbd9f57e58783809 AS build

RUN cargo install \
      --locked \
      --root /opt/uv \
      --bin uv --bin uvx uv \
      --version 0.13.6

FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e
COPY --from=build /opt/uv /opt/uv

ENTRYPOINT ["/opt/uv/bin/uv"]
