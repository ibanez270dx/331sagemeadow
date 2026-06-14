# Agent Instructions — 331 Sage Meadow

## Analytics: Mixpanel

This project uses **Mixpanel** for analytics. The SDK is initialized client-side in `views/index.erb`.

### Project token
`ff578562e61cb163a0946c529d81dd0f`

Token is hardcoded directly in the Mixpanel `init` call inside `<head>` in `views/index.erb`. No environment variable split is configured (single project, no dev/prod split yet).

### Platform
- Client-side JavaScript (browser), loaded via the Mixpanel CDN snippet
- No CDP, no server-side tracking

### Consent
- No consent gate — US-only audience (Texas/regional)

### Identity
- No user accounts; all visitors are anonymous. Do **not** add `identify()` or `reset()` calls unless authentication is introduced.

### Events tracked

| Event name | Trigger | Key properties |
|---|---|---|
| `page_viewed` | Automatic on every page load (`track_pageview: true` in init) | _(auto)_ |
| `agent_phone_clicked` | Visitor clicks a phone link (`.agent-phone`) | `agent_name`, `phone_number` |
| `agent_email_clicked` | Visitor clicks an email link (`.agent-email`) | `agent_name`, `email_address` |
| `showing_requested` | Visitor clicks "Schedule a Private Showing" nav CTA (`.nav-cta`) | _(none)_ |

### Adding new events

1. Follow `snake_case` naming: `object_verb` (e.g. `gallery_image_viewed`)
2. Add the listener inside the `DOMContentLoaded` callback in `views/index.erb`, alongside the existing Mixpanel tracking block
3. Never construct event or property names dynamically at runtime
4. Never send `null` or `""` — omit the property if it has no value
5. Numeric values must be unquoted
6. Verify new events in Mixpanel Live View before considering implementation complete

### Value Moment
`showing_requested` — a visitor clicking to schedule a private showing is the clearest signal of purchase intent.
