FROM dhi.io/rust:1.99.1-debian13-dev@sha256:be6c6ec91c61ae15b80521052df1c7f60fefd303293563b3dbd9f57e58783809 AS build

RUN cargo install \
      --locked \
      --features cli \
      cargo-about \
      --version 0.9.3

RUN cargo install \
      --locked \
      --root /opt/uv \
      --bin uv --bin uvx uv \
      --version 0.13.6

ADD --checksum=sha256:c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 https://raw.githubusercontent.com/astral-sh/uv/0.13.6/LICENSE-APACHE /opt/uv/share/licenses/uv/
ADD --checksum=sha256:860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c https://raw.githubusercontent.com/astral-sh/uv/0.13.6/LICENSE-MIT /opt/uv/share/licenses/uv/
COPY about.toml about.hbs /tmp/about/
RUN src=$(echo "${CARGO_HOME:-$HOME/.cargo}"/registry/src/*/uv-0.13.6) && \
    chmod 644 /opt/uv/share/licenses/uv/* && \
    cargo about generate \
      --locked \
      --fail \
      --manifest-path "$src/Cargo.toml" \
      --config /tmp/about/about.toml \
      --output-file /opt/uv/share/licenses/uv/THIRD-PARTY-LICENSES \
      /tmp/about/about.hbs

FROM scratch

COPY --from=build /opt/uv /opt/uv
