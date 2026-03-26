-- Exact Match: Schema inicial
-- Migration: 00001_init.sql

-- Usuários
CREATE TABLE IF NOT EXISTS usuarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  auth_id UUID UNIQUE,
  nome TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  perfil TEXT DEFAULT 'usuario',
  ativo BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Itens para matching
CREATE TABLE IF NOT EXISTS itens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  descricao TEXT,
  categoria TEXT,
  tags JSONB DEFAULT '[]',
  metadata JSONB DEFAULT '{}',
  criado_por UUID REFERENCES usuarios(id),
  status TEXT DEFAULT 'ativo',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Matches realizados
CREATE TABLE IF NOT EXISTS matches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  item_a UUID REFERENCES itens(id),
  item_b UUID REFERENCES itens(id),
  score NUMERIC DEFAULT 0,
  status TEXT DEFAULT 'pendente', -- pendente, aprovado, rejeitado
  motivo TEXT,
  criado_por UUID REFERENCES usuarios(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Configurações do sistema
CREATE TABLE IF NOT EXISTS system_configs (
  key TEXT PRIMARY KEY,
  value JSONB,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Logs de atividade
CREATE TABLE IF NOT EXISTS activity_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  usuario_id UUID REFERENCES usuarios(id),
  acao TEXT NOT NULL,
  detalhes JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);
