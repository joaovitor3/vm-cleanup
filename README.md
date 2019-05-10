# vm-cleanup

Repositório para realizar a limpeza de imagens e containers não utilizados em hosts periodicamente, utilizando Rancher 1.6.

É necessário que você possua suas configurações do seu host do rancher 1.6.

Para pegar essas configurações acesse o rancher 1.6 e vá em Infrastuctures->Hosts. Isso irá abrir uma nova página e nela você pode realizar o download das configurações do seu host. Clique no dropdown de configurações do seu host e selecione a opção de machine config, com isso irá ser baixado um arquivo compactado com as configurações. Realize a extração desse arquivo e entre na pasta que foi descompactada. Nela irão ter duas pastas certs e machines, entre na pasta machines e subsequentemente na pasta com o nome do host.
Nessa pasta estão todas as suas chaves de configuração, porém a de relevância para agora será somente a do arquivo id_rsa.
Realize a exportação desse arquivo como variável de ambiente:

```sh
export ID_RSA=your_id_rsa
```

## Exportação de variáveis

Modifique as variáveis contidas no arquivo export.sh, nele existem alguns exemplos de configuração.

USERNAME - Usuário que você utiliza para acessar a máquina virtual.
SCRIPT - Script para limpeza da máquina virtual, no export.sh o comando default é docker system prune que remove todos containers, networks e imagens não utilizados, a opção -a remove todas as imagens e não somente as pendentes(dangling). Sinta-se a vontade para modificar esse comando de acordo com as suas necessidades
ID_RSA - ID_RSA da sua máquina virtual
HOSTS - Host da sua máquina virtual

Por exemplo, se seu usuário é test com o host 123.123.12.312 e deseja realizar prune apenas das imagens não utilizadas, o arquivo export.sh ficaria assim:

```sh
export USERNAME=test
export HOSTS=123.123.12.312
export SCRIPT="docker image prune -a -f"
```

Obs: É possível realizar essa operação para diversos hosts, basta ao exportar a variável HOSTS, exportar os n hosts. Como exemplificado abaixo:

```sh
export HOSTS="123.123.12.312 111.111.11.111"
```