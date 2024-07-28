# provider_todo_list

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)


## Tecnologias Utilizadas

### **Provider**:
O Flutter desenvolveu bibliotecas que aprimoram nossas soluções digitais. Uma das mais poderosas é chamada Provider.

O Provider foi criado para tornar a implementação do InheritedWidget mais fácil e reutilizável. Em outras palavras, ele é um wrapper do InheritedWidget.
Um **wrapper** é um tipo de design pattern comumente usado em programação para fornecer uma camada de abstração sobre um objeto ou componente existente.
**InheritedWidget** é um widget especial que permite compartilhar dados entre vários widgets na árvore de widgets.

**Para compartilhar informações entre a árvore de widgets.**
Certo, para entender melhor esse conceito, imagine que queremos compartilhar informações por meio da árvore de widgets. Quando navegamos para uma nova tela, precisamos compartilhar entidades com dados comuns entre essas telas. Utilizar a árvore de widgets para essa finalidade pode não ser a abordagem mais eficiente ou adequada.

Além disso, a equipe do Flutter criou os InheritedWidgets. Eles permitem compartilhar informações por toda a árvore de widgets e contêm outros widgets.

No entanto, os InheritedWidgets eram difíceis de implementar, especialmente quando era necessário consumir e atualizar dados de forma fácil. Por esse motivo, o pacote Provider começou como uma extensão do InheritedWidget, facilitando o manuseio de informações por toda a árvore de widgets.
![image](https://github.com/user-attachments/assets/1ad730b7-9c2c-4299-a8ee-c1b297518039)

Na imagem acima, você pode ver o desempenho do Provider sendo o pai de todos os widgets. Ele pode compartilhar as informações com quem precisar, e o Consumer pode atualizar as informações do seu pai.
**Agora uma breve introdução de como usar o Provider e o que ele oferece para nós.**
```
dependências: 
  flutter: 
    sdk: flutter 
  provider :version
```
Com o Provider você tem várias ferramentas à sua disposição:

**ChangeNotifier:** Este deve ser estendido para fornecer um objeto que pode ser usado para enviar notificações de mudanças para seus ouvintes.

**ChangeNotifierProvider:** Ele tem mudanças de um ChangeNotifier. Widgets filhos podem acessar o objeto de estado e ouvir as mudanças.

**Consumer:** Reconstrói parte de uma sub árvore quando o estado de escuta muda.

**Provider.of:** Permite que widgets descendentes acessem o objeto de estado.

- **Uuid**:
- **Very Good Analysis**:
- **Flutter Secure Storage**:
- **flutter Localizations**:
