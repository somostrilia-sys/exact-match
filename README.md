# Exact Match

Sistema de matching do Grupo WALK Holding.

## Descrição

Exact Match é uma plataforma de correspondência inteligente que permite criar, gerenciar e analisar matches entre itens cadastrados no sistema.

## Stack

- [Supabase](https://supabase.com) — banco de dados, autenticação e API
- PostgreSQL — armazenamento relacional com RLS (Row Level Security)

## Variáveis de ambiente

Copie `.env.example` para `.env` e preencha:

```env
SUPABASE_URL=https://xytnibnqztjaixemlepb.supabase.co
SUPABASE_ANON_KEY=<sua anon key>
SUPABASE_SERVICE_ROLE_KEY=<sua service role key>
```

## Migrações

As migrações estão em `supabase/migrations/`.

Para aplicar manualmente via Supabase CLI:

```bash
supabase db push
```

Ou execute os arquivos `.sql` diretamente no SQL Editor do Supabase Dashboard.

## Estrutura do banco

| Tabela | Descrição |
|---|---|
| `usuarios` | Usuários do sistema |
| `itens` | Itens disponíveis para matching |
| `matches` | Correspondências realizadas entre itens |
| `system_configs` | Configurações globais do sistema |
| `activity_logs` | Logs de auditoria e atividade |

Todas as tabelas possuem **Row Level Security (RLS)** habilitado. Usuários autenticados têm acesso completo.

## Ordem das migrações

1. `00001_init.sql` — criação das tabelas base
2. `00002_rls_policies.sql` — habilitação do RLS e políticas de acesso
