FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e AS python-licenses

ADD --checksum=sha256:070b1e7da3db719755a2fdaa0cb836f41d3138e0c3ecf4669eb08f62fbb28021 https://github.com/astral-sh/python-build-standalone/releases/download/20261026/cpython-3.14.10+20261026-aarch64-unknown-linux-gnu-debug-full.tar.zst /tmp/python.tar.zst
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      zstd=1.5.7+dfsg-1+deb13u0+dhi2 && \
    tar -xf /tmp/python.tar.zst -C /tmp python/licenses && \
    install -D -m 644 -t /opt/python/share/licenses/python /tmp/python/licenses/*

FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e
ENV LANG=C.UTF-8

COPY --from=startown/zsh:5.9@sha256:1851f696fdf459eb485478f4ad18ffc157b4d33e9ce9ae1730bd4f756d5cab14 /opt/zsh /
COPY --from=startown/uv:0.13.6@sha256:dbe377505ec7674eac78833436eba81cfa88ce7d0ebeae85188e1b5017ea62ba /opt/uv/bin/ /usr/local/bin/
COPY --from=startown/uv:0.13.6@sha256:dbe377505ec7674eac78833436eba81cfa88ce7d0ebeae85188e1b5017ea62ba /opt/uv/share/licenses/ /usr/local/share/licenses/
COPY --from=startown/jj:0.46.0@sha256:a9d89af1488a196ca249bf16bd46f2c063dad9305401006faed49b86bf92e2e5 /opt/jj/bin/jj /usr/local/bin/jj
COPY --from=startown/jj:0.46.0@sha256:a9d89af1488a196ca249bf16bd46f2c063dad9305401006faed49b86bf92e2e5 /opt/jj/share/licenses/ /usr/local/share/licenses/
COPY --from=python-licenses /opt/python/share/licenses/ /usr/local/share/licenses/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      btop=1.3.2-0.1 \
      git=1:2.47.3-0+deb13u1+dhi2 \
      openssh-client=1:10.0p1-7+deb13u4+dhi1 \
      tree=2.2.1-1+deb13u0+dhi0 && \
    rm -rf /var/lib/apt/lists/*

RUN uv python install 3.14.10 && \
    grep -qx 20261026 /root/.local/share/uv/python/cpython-3.14.10-*/BUILD && \
    rm -rf \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/ensurepip \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/site-packages/pip*

WORKDIR /root
ENTRYPOINT ["/usr/bin/zsh"]
