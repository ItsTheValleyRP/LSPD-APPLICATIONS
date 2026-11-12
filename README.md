# The Valley — LSPD Applications

Standalone LSPD recruitment portal for The Valley Roleplay.

## Deploy with GitHub Pages
1. Open repository Settings → Pages.
2. Set the source to Deploy from a branch.
3. Select `main` and `/ (root)`, then Save.
4. Preview at https://itsthevalleyrp.github.io/LSPD-APPLICATIONS/

## Configure Supabase
1. In Supabase SQL Editor, run `supabase/lspd_form_setup.sql` to add/update only the LSPD form definition.
2. In Authentication → URL Configuration, ensure the deployed URL is allowed as a redirect URL:
   `https://itsthevalleyrp.github.io/LSPD-APPLICATIONS/`
3. Ensure the Discord OAuth provider is configured for the existing project.

## Access rules
- Uses the existing Valley Supabase project and shared application tables.
- LSPD reviewers are users with LSPD-scoped `department_head`, `command_team`, or `application_reviewer` roles, plus the Super Owner.
- Applicant submissions are restricted to the signed-in applicant; review actions are checked server-side by the existing portal RPCs and database RLS.
- No FiveM resources, bots, or server code are required.
- Never put a Supabase service-role/secret key in this public repository.

The shared security migration must already be installed and verified before public launch. Test with a normal applicant and an authorized LSPD reviewer.
