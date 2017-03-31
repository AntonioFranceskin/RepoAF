module Utilities
require "colorize"
require 'date'
require 'time'
require 'launchy'

# Menu  Principal del  Lector

  def menu()
	system("clear")
	puts 
	puts 
	print "                     ".uncolorize
	puts "L E C T O R   D E   N O T I C I A S".blue.blink.underline 
	puts
	print "                     ".uncolorize
	puts "Opciones:".colorize( :background => :blue)
	print "                     ".uncolorize
	print "1.- ".colorize( :background => :red)
	print "Seleccionar Noticias de Reddit"
	puts
	print "                     ".uncolorize
	print "2.- ".colorize( :background => :red)
	print "Seleccionar Noticias de Mashable"
	puts
	print "                     ".uncolorize
	print "3.- ".colorize( :background => :red)
	print "Seleccionar Noticias de Digg"
	puts
	print "                     ".uncolorize
	print "4.- ".colorize( :background => :red)
	print "Todas  las  Noticias ordenadas por  Fecha"
	puts
	print "                     ".uncolorize
	print "5.- ".colorize( :background => :red)
	print "Disparar un URL en el Navegador"
	puts
	print "                     ".uncolorize
	print "6.- ".colorize( :background => :red)
	print "Salir"
	puts
	print "                     ".uncolorize
	print "Opcion: ".colorize( :background => :blue)
	opcion  = gets.chomp.to_i
	return  opcion
  end

# Selector  de  la  Opcion del  Usuario

def selection(store)
	cycle =  true
    while cycle do
	      opcion = menu()
	      case opcion 
				when 1 then
					rss = "Reddit"
					rss_view(store,rss)
				when 2 then
					rss = "Mashable"
					rss_view(store,rss)
				when 3 then
					rss = "Digg"
					rss_view(store,rss)
				when 4 then
					rss = "All"
					rss_view(store,rss)
				when 5 then
					puts "Ingrese  el URL".colorize( :background => :blue)
					get_url = gets.chomp
#					Launchy.open( "http://www.ruby-lang.org" )
					Launchy.open(get_url)
				when 6 then
					puts "HASTA LUEGO".colorize( :background => :blue)
					puts "Presione Enter para continuar...".colorize( :background => :red)
					cycle = false
				else
					puts "Opcion incorrecta".colorize( :background => :blue)
					puts "Presione Enter para continuar...".colorize( :background => :red)
			end
		gets
   end	
   system("clear")
end

# Publicador de  las  Noticias  en  Pantalla

  def rss_view(store,rss)
		if rss != nil then
			line_per_page = 7 
			counter = 0
			puts  "".uncolorize
			print  " N O T I C I A S   D E L  P R O V E E D O R:  ".blue.blink.underline 
			print  "#{rss}".red.blink.underline 
			puts  "".uncolorize
			for  i  in  0..store.length-1 
				if store[i][4] == rss  || rss == "All" then
					fecha = Time.at(store[i][0])
					fecha1 = fecha.to_s
					f = DateTime.parse(fecha1)
					fecha2  = "#{f.mday}/#{f.mon}/#{f.year} #{f.hour}:#{f.min}:#{f.sec}"
					puts 
    				puts "FECHA:           #{fecha2}     AUTOR:         #{store[i][1]}        PROVEEDOR:            #{store[i][4]}"
					puts "Titulo de la Noticia  #{store[i][3]}" 
					puts "U R L                 #{store[i][2]}" 
					puts "=========================================================================================================="
					counter += 1
					if counter  ==  line_per_page  then  
					puts  " ************* Seleccione  su  URL  y  guardelo  en  el  portapapele ********************".blue.on_red.blink
					counter = 0
					gets
					end	
				end	
			end	
		end	
  end
end
