const okta = require("@okta/okta-sdk-nodejs");
const ExpressOIDC = require("@okta/oidc-middleware").ExpressOIDC;

const oktaClient = new okta.Client({
    orgUrl: 'https://dev-879263.oktapreview.com',
    token: '008JCBq3v2CxfdNp5NUekrXhUVqzEvpMdNsbGq5SIO'
});

const oidc = new ExpressOIDC({
    issuer: process.env.OKTA_ORG_URL + "/oauth2/default",
    client_id: process.env.OKTA_CLIENT_ID,
    client_secret: process.env.OKTA_CLIENT_SECRET,
    redirect_uri: process.env.OKTA_CALLBACK_URI || "http://localhost:3000/users/callback",
    scope: "openid profile",
    routes: {
        login: {
            path: "/users/login"
        },
        callback: {
            path: "/users/callback",
            defaultRedirect: "/dashboard"
        }
    }
});

module.exports = { oidc, oktaClient };