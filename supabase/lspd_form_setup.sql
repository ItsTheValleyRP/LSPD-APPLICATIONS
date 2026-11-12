-- THE VALLEY | LSPD APPLICATION FORM
-- Safe additive/upsert: changes only the LSPD form definition.
-- Does not delete applications, roles, audit records, or other department forms.

insert into public.valley_application_forms
  (department, title, description, questions, is_open, updated_at)
values
  ('lspd',
   'LSPD Application',
   'Apply to join the Los Santos Police Department. Serve the city through professionalism, integrity, and public service.',
   '[
     {"key":"character_name","label":"What is your in-city name?","type":"text","required":true},
     {"key":"discord_name","label":"What is your Discord username?","type":"text","required":true},
     {"key":"experience","label":"Do you have any previous law enforcement experience? If so, explain.","type":"textarea","required":true},
     {"key":"why","label":"Why do you want to join the Los Santos Police Department?","type":"textarea","required":true},
     {"key":"availability","label":"What is your typical availability in the city?","type":"text","required":true}
   ]'::jsonb,
   true,
   now())
on conflict (department) do update
set title = excluded.title,
    description = excluded.description,
    questions = excluded.questions,
    is_open = excluded.is_open,
    updated_at = now();
