FROM wordpress:6.8.2

# Update repo references, install necessary unzip tool and clear cache
RUN apt update && apt install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*

# Download woocommerce plugin archive from wordpress.org, unzip the plugin to wp-content and remove used archive
RUN curl -o /tmp/plugin.zip -fSL https://downloads.wordpress.org/plugin/woocommerce.10.1.2.zip \
    && unzip /tmp/plugin.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm /tmp/plugin.zip