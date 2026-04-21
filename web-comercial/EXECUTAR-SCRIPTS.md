# 🔧 Como Tornar os Scripts Executáveis

Os scripts `.sh` precisam de permissão de execução no Linux.

## 🎯 Comando Único (Recomendado)

Execute este comando uma vez na pasta do projeto:

```bash
chmod +x *.sh
```

Isso dá permissão de execução para **todos** os scripts `.sh` de uma vez!

---

## ✅ Verificar se Funcionou

```bash
ls -lh *.sh
```

Deve aparecer `-rwxr-xr-x` (com os `x` = executável)

---

## 🚀 Depois é Só Executar

```bash
# Atualizar no GitHub
bash ATUALIZAR-AGORA.sh

# OU (se deu permissão)
./ATUALIZAR-AGORA.sh
```

```bash
# Verificar vídeo
bash VERIFICAR-TAMANHO-VIDEO.sh

# OU
./VERIFICAR-TAMANHO-VIDEO.sh
```

---

## 📝 Scripts Disponíveis

| Script | Função |
|--------|--------|
| `ATUALIZAR-AGORA.sh` | Faz add/commit/push automático |
| `VERIFICAR-TAMANHO-VIDEO.sh` | Verifica tamanho do vídeo |
| `COMANDOS-RAPIDOS.sh` | Atalhos úteis |

---

## 🐛 Se Der Erro

### Erro: "Permission denied"

```bash
chmod +x ATUALIZAR-AGORA.sh
bash ATUALIZAR-AGORA.sh
```

### Erro: "command not found"

```bash
# Use bash antes do nome
bash ATUALIZAR-AGORA.sh
```

---

**Pronto! ✅** Agora seus scripts estão prontos para usar!
