# mint-deploy

Pre-requisites:

- Docker and Docker Compose
- Vault

To set up and run (can safely be repeated e.g. in order to update SSL cert): 

1. `echo DOMAIN=mint-dev.dide.ic.ac.uk >.env` (use `mint-dev.dide.ic.ac.uk` for staging, or `mint.dide.ic.ac.uk` for production)
1. `./mint-deploy up`

To update to latest mint/mintr and restart:

- `./mint-deploy pull`

To shut down:

- `./mint-deploy down`

If you need to deploy a branch other than `main` for the app and/or API you can specify via a `.env` file:

```shell
FRONTEND_REF=mrc-2186
API_REF=mrc-2186
```

## Using Let's Encrypt

We mount a shared volume (`mint-tls`) into the proxy, and a long-running
process, [acme-buddy](https://github.com/reside-ic/acme-buddy), is our ACME client
that talks to Let's Encrypt and requests a new certificate a while before expiry.
It then writes that into the `mint-tls` volume, and sends a signal to the
proxy causing Nginx to load the new certificate.

When testing this on a new deployment, we should set an environment variable
`ACME_BUDDY_STAGING` to `1` - this causes acme-buddy to request staging certificates
from Let's Encrypt. This provides test certificates; without doing this, there is a
[rate limit](https://letsencrypt.org/docs/rate-limits/) of 5 renewals per day
per domain name. Once testing looks good, the environment variable can be omitted
or set to `0` for the final deploy.