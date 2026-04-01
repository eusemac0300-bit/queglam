-- Supabase Schema for ¡Qué Glam!

-- 1. Table: productos
CREATE TABLE IF NOT EXISTS productos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    nombre TEXT NOT NULL,
    precio NUMERIC NOT NULL,
    imagen_url TEXT,
    descripcion TEXT
);

-- 2. Table: reservas
CREATE TABLE IF NOT EXISTS reservas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    nombre TEXT,
    telefono TEXT,
    servicio TEXT,
    fecha DATE NOT NULL,
    horario TEXT NOT NULL,
    comuna TEXT,
    comentarios TEXT,
    estado TEXT DEFAULT 'pendiente' -- o 'confirmada', 'cancelada', 'bloqueo'
);

-- 3. Table: MarketingCampaigns
CREATE TABLE IF NOT EXISTS MarketingCampaigns (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    campaign_name VARCHAR(255),
    source_image_url TEXT NOT NULL,
    hair_technique VARCHAR(50) NOT NULL,
    content_type VARCHAR(50) NOT NULL,
    generated_content JSONB,
    status VARCHAR(20) DEFAULT 'Generated'
);

-- Row Level Security (RLS) - Basic Enable
ALTER TABLE productos ENABLE ROW LEVEL SECURITY;
ALTER TABLE reservas ENABLE ROW LEVEL SECURITY;
ALTER TABLE MarketingCampaigns ENABLE ROW LEVEL SECURITY;

-- Policies (Public access for the landing, Restricted can be added later)
CREATE POLICY "Public Select" ON productos FOR SELECT USING (true);
CREATE POLICY "Public Insert" ON productos FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Delete" ON productos FOR DELETE USING (true);

CREATE POLICY "Public Select" ON reservas FOR SELECT USING (true);
CREATE POLICY "Public Insert" ON reservas FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Delete" ON reservas FOR DELETE USING (true);

CREATE POLICY "Public Select" ON MarketingCampaigns FOR SELECT USING (true);
CREATE POLICY "Public Insert" ON MarketingCampaigns FOR INSERT WITH CHECK (true);
