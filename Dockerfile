# ЕТАП 1: Беремо інструменти (Shell, Wget) з Busybox
# Використовуємо uclibc версію, бо вона статична і не вимагає бібліотек
FROM busybox:1.35.0-uclibc as tools

# ЕТАП 2: Беремо оригінальну програму http-echo
FROM hashicorp/http-echo:0.2.3 as app_source

# ЕТАП 3: Збираємо фінальний образ на базі Distroless
FROM gcr.io/distroless/base-debian11

# 1. Копіюємо нашу програму (http-echo)
COPY --from=app_source /http-echo /http-echo

# 2. Копіюємо sh (це насправді busybox) щоб працював exec
COPY --from=tools /bin/sh /bin/sh

# 3. Копіюємо wget для healthcheck (Busybox має вбудований wget)
COPY --from=tools /bin/wget /bin/wget

# Налаштування
ENV ECHO_TEXT="hello-world"
EXPOSE 5678

# Запускаємо програму напряму (shell нам потрібен лише для дебагу/хелчека)
ENTRYPOINT ["/http-echo"]
