FROM dhi.io/rust:1.99.1-debian13-dev@sha256:be6c6ec91c61ae15b80521052df1c7f60fefd303293563b3dbd9f57e58783809 AS build

RUN cargo install \
      --locked \
      --features cli \
      cargo-about \
      --version 0.9.3

RUN cargo install \
      --locked \
      --root /opt/jj \
      --bin jj jj-cli \
      --version 0.46.0

COPY about.toml about.hbs /tmp/about/
RUN src=$(echo "${CARGO_HOME:-$HOME/.cargo}"/registry/src/*/jj-cli-0.46.0) && \
    install -D -m 644 -t /opt/jj/share/licenses/jj "$src/LICENSE" && \
    cargo about generate \
      --locked \
      --fail \
      --manifest-path "$src/Cargo.toml" \
      --config /tmp/about/about.toml \
      --output-file /opt/jj/share/licenses/jj/THIRD-PARTY-LICENSES \
      /tmp/about/about.hbs

FROM scratch

COPY --from=build /opt/jj /opt/jj
