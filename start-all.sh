#!/bin/bash

echo "🚀 Iniciando infraestructura (PostgreSQL + NATS)..."
docker-compose up -d

echo "⏳ Esperando que los servicios estén listos..."
sleep 5

echo "🔧 Iniciando microservicios..."

# Products MS
echo "📦 Iniciando Products MS..."
cd products-ms
npm run start:dev &
PRODUCTS_PID=$!
cd ..

# Orders MS  
echo "📋 Iniciando Orders MS..."
cd orders-ms
npm run start:dev &
ORDERS_PID=$!
cd ..

# Client Gateway
echo "🌐 Iniciando Client Gateway..."
cd client-gateway
npm run start:dev &
GATEWAY_PID=$!
cd ..

echo ""
echo "✅ Todos los servicios están ejecutándose:"
echo "   🌐 Client Gateway: http://localhost:3001"
echo "   📦 Products MS: http://localhost:3000"
echo "   📋 Orders MS: http://localhost:3002"
echo "   💾 PostgreSQL: localhost:5433"
echo "   📡 NATS: localhost:4222"
echo ""
echo "PIDs de los procesos:"
echo "   Products MS: $PRODUCTS_PID"
echo "   Orders MS: $ORDERS_PID"
echo "   Gateway: $GATEWAY_PID"
echo ""
echo "Para detener todo: ./stop-all.sh"

# Mantener el script corriendo
wait