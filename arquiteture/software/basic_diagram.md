# Módulo Admin (App/Web) — Árvore de Funcionalidades + DB + Rascunho do Software

## 1) Diagrama de árvore — Administração (App/Web)
> **Não é a vara RFID.** É o painel (web) ou app de celular para administrar o sistema.

```text
Admin Console (Web/App) - Management Tree
│
├── 1) Authentication & Access
│   ├── login
│   ├── logout
│   ├── password_reset
│   └── session_management
│
├── 2) Users & Roles
│   ├── users (CRUD)
│   │   ├── create_user
│   │   ├── update_user
│   │   ├── disable_user
│   │   └── list_users
│   ├── roles (CRUD)
│   │   ├── create_role
│   │   ├── assign_permissions
│   │   └── list_roles
│   └── permissions (system-defined)
│       ├── cattle_read / cattle_write
│       ├── events_read
│       ├── health_write
│       ├── inventory_write
│       ├── device_manage
│       └── admin_manage
│
├── 3) Cattle Registry (Master Data)
│   ├── cattle (CRUD)
│   │   ├── create_cattle_profile
│   │   ├── update_cattle_profile
│   │   ├── change_status (active/sold/dead/missing)
│   │   └── delete_cattle (restricted)
│   ├── ear_tags (Tag History)
│   │   ├── assign_new_tag
│   │   ├── deactivate_tag
│   │   └── tag_audit_log
│   └── cattle_profile_view
│       ├── identity (cattle_id, ear_tag_code)
│       ├── photo
│       ├── economic_info (purchase_price)
│       ├── biological_info (birth_date, breed)
│       └── quick_status (current_site, current_lot, last_seen)
│
├── 4) Farm Topology (Sites & Locations)
│   ├── sites (CRUD)
│   ├── locations (CRUD)
│   ├── lots (CRUD)
│   └── mapping
│       ├── link_device_to_site
│       ├── link_reader_to_location
│       └── validate_location_codes
│
├── 5) Devices & Integrations
│   ├── devices (CRUD)
│   │   ├── register_device (rfid_stick/jetson/gateway)
│   │   ├── set_site_binding
│   │   ├── set_device_keys (optional)
│   │   └── view_device_health (last_seen, battery)
│   ├── mqtt_topics_reference (read-only)
│   └── data_ingestion_monitor
│       ├── unknown_tag_events
│       ├── duplicate_events
│       └── offline_devices
│
├── 6) Operations (Admin Tools)
│   ├── event_timeline (query)
│   ├── manual_event_entry (restricted)
│   ├── data_export (CSV/JSON)
│   └── audit_logs
│
└── 7) Alerts & Rules
    ├── alerts_inbox
    ├── acknowledge_alert
    ├── close_alert
    └── rules_config (optional)
        ├── water_missing_threshold_h
        ├── gate_mismatch_rules
        └── boundary_violation_rules
