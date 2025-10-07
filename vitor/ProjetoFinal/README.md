Aplicativo Flutter desenvolvido como projeto final da disciplina **Desenvolvimento Mobile Multiplataforma**.  
O app simula uma plataforma de restaurantes, exibindo categorias, estabelecimentos e postagens recentes.
# ceub-dev-multiplataforma-2025
# Atividade RESTAURANTE


## Funcionalidades

- Lista de **restaurantes** com imagem, nome e descrição (scroll horizontal).  
- Exibição de **categorias** gastronômicas em formato dinâmico.  
- Seção de **postagens recentes** com foto e comentário.  
- Alternância entre **tema claro e escuro**.  
- Sistema de **favoritos**.  
- Tratamento de erros e uso de **placeholders** para imagens.  
- Consumo de **API mock**: [`https://app-restaurant.wiremockapi.cloud`](https://app-restaurant.wiremockapi.cloud)


## Como executar o projeto

### 1. Instalar o Flutter
Baixe o Flutter SDK (stable) em ```flutter.dev```  
Extraia em ```C:\src\flutter``` e adicione ```C:\src\flutter\bin``` ao PATH.  
Depois, confirme com:
```bash
flutter doctor -v
```

### 2. Clonar o projeto e baixar dependências

```bash
git clone <link_repositorio>
cd <endereco_local_do_projeto>
flutter pub get
```

### 3. Executar no navegador (modo Web)
Isso abre o Chrome com CORS desativado, permitindo carregar imagens externas.  
Evite navegar em outros sites nessa mesma janela.  
```bash
flutter run -d chrome --web-browser-flag="--disable-web-security" --web-browser-flag="--user-data-dir=C:\tmp\chrome-dev"
```

### 5. Demonstração

Segue GIF demonstrando o funcionamento do aplicativo.  

![git](docs/teste.gif)
