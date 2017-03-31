
require_relative './Modulo/Utilities'
require_relative './Class/Reddit'
require_relative './Class/Mashable'
require_relative './Class/Digg'
include Utilities
# Programa Lector de Noticia  
# Autor Antonio Franceskin
# Fecha 31/Mar/2017
#
# Estructuras de almacenamiento de  Noticias Store es  una  matriz  original  y Store es la matriz Ordenada por  Fecha
total_numof_notice = 0
store = []
# Instanciar  los  proveedores  de  noticias
reddit = Reddit.new
mashable = Mashable.new
digg = Digg.new
# Leer las  noticia  y  cargarla  en  la  estructura  inicial Store2
total_numof_notice = reddit.redditgets(store,total_numof_notice)
total_numof_notice = mashable.mashablegets(store,total_numof_notice)
total_numof_notice = digg.digggets(store,total_numof_notice)
# Ordenamiento de la  estructura de  almacenamiento de  noticias / Tambien  pdemos  ordenar por  otros  valores  
store = store.sort_by {|i| i[0]}
# Entrar en  el  ciclo  principal del  proceso  a  modelar
selection(store)
