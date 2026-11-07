FROM dhi.io/debian-base:trixie-dev@sha256:61025cea33d5910165ced8b33edd3f6b6bfe161e129174887936a1b9a1442b20 AS python-licenses

ADD --checksum=sha256:070b1e7da3db719755a2fdaa0cb836f41d3138e0c3ecf4669eb08f62fbb28021 https://github.com/astral-sh/python-build-standalone/releases/download/20261026/cpython-3.14.10+20261026-aarch64-unknown-linux-gnu-debug-full.tar.zst /tmp/python.tar.zst
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      zstd=1.5.7+dfsg-1+deb13u0+dhi3 && \
    tar -xf /tmp/python.tar.zst -C /tmp python/licenses && \
    install -D -m 644 -t /opt/python/share/licenses/python /tmp/python/licenses/*

FROM dhi.io/debian-base:trixie-dev@sha256:61025cea33d5910165ced8b33edd3f6b6bfe161e129174887936a1b9a1442b20
ENV LANG=C.UTF-8

COPY --from=zsh /opt/zsh /
COPY --from=uv /opt/uv/bin/ /usr/local/bin/
COPY --from=uv /opt/uv/share/licenses/ /usr/local/share/licenses/
COPY --from=jj /opt/jj/bin/jj /usr/local/bin/jj
COPY --from=jj /opt/jj/share/licenses/ /usr/local/share/licenses/
COPY --from=python-licenses /opt/python/share/licenses/ /usr/local/share/licenses/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      btop=1.3.2-0.1 \
      git=1:2.47.3-0+deb13u1+dhi2 \
      openssh-client=1:10.0p1-7+deb13u4+dhi2 \
      tree=2.2.1-1+deb13u0+dhi0 && \
    rm -rf /var/lib/apt/lists/*

RUN uv python install 3.14.10 && \
    rm -rf \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/ensurepip \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/site-packages/pip*

WORKDIR /root
ENTRYPOINT ["/usr/bin/zsh"]
