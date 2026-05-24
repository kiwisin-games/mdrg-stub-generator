# Next prompt: apply reviewed runtime callback notes

Use `data/runtime_callback_evidence.json` and the three runtime evidence reports as review material.

Rules:
- Do not edit `library/*.d.lua` manually.
- Apply only documentation comments that are confirmed by runtime reports and still align with `docs.txt`.
- Keep caution notes for `not-assignable-from-plain-lua`, `requires-csharp-bridge`, and `requires-runtime-instance`.
- Do not create APIs, fields or type changes from callback reports alone.
