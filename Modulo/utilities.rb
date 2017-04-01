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
					getpage = "All"
					nouse = rss_view(store,rss,getpage,0)
				when 2 then
					rss = "Mashable"
					getpage = "All"					
					nouse = rss_view(store,rss,getpage,0)
				when 3 then
					rss = "Digg"
					getpage = "All"
					nouse = rss_view(store,rss,getpage,0)
				when 4 then
					rss = "All"
					nouse = rss_view(store,rss,getpage,0)
				when 5 then
					puts "Ingrese  el Proveedor (Reddit, Mashable, Digg o All)".colorize( :background => :blue)
					rss = gets.chomp
					puts "Buscar el URL en la Pagina (Coloque All para buscar su pagina) ".colorize( :background => :blue)
					getpage = gets.chomp
					get_url = rss_view(store,rss,getpage,1)
					if get_url.class != Range
						puts "ENTRE"
						Launchy.open(get_url)
					end
				when 6 then
					puts "HASTA LUEGO".colorize( :background => :blue)
					puts "Presione Enter para continuar...".colorize( :background => :red)
					cycle = false
				else
					puts "Opcion incorrecta".colorize( :background => :blue)
					puts "Presione Enter para continuar...".colorize( :background => :red)
			end
   end	
   system("clear")
end

# Publicador de  las  Noticias  en  Pantalla

  def rss_view(store,rss,page,search_url)
		if rss != nil then
			line_per_page = 7 
			page_number = 1
			counter = 0
			noagain = true
			mostrar = []
			if page != "All" then
				page = page.to_i
			end	
			for  i  in  0..store.length-1 
				if counter == 0 && noagain then
					system("clear")
					puts  " "
					print  " N O T I C I A S   D E L  P R O V E E D O R:  ".blue.blink.underline 
					print  "#{rss}".red.blink.underline 
					puts  "".uncolorize	 
					puts  "".uncolorize	
					print  " P A G I N A  No. :  ".blue.blink.underline 
					print  "#{page_number}".red.blink.underline 
					puts   " "
					noagain = false
				end
				if (store[i][4] == rss  || rss == "All")  then
					counter += 1
					if ((page_number == page) || (page == "All")) then
						fecha = Time.at(store[i][0])
						fecha1 = fecha.to_s
						f = DateTime.parse(fecha1)
						fecha2  = "#{f.mday}/#{f.mon}/#{f.year} #{f.hour}:#{f.min}:#{f.sec}"
						puts 
    					puts "FECHA:           #{fecha2}     AUTOR:         #{store[i][1]}        PROVEEDOR:            #{store[i][4]}   Linea  #{counter} / #{i}"
						puts "Titulo de la Noticia  #{store[i][3]}" 
						puts "U R L                 #{store[i][2]}" 
						puts "=========================================================================================================="
					mostrar[counter-1] = i
					end
				end

				if counter  ==  line_per_page  || i == (store.length-1) then  
						puts  "✥✤✦✠✫✬✭✰✱✻✼❀❂❃❄✷✴✛✙⛥⛤⛭⛯✥✤✦✠✫✬✭✰✱✻✼❀❂❃❄✷✴✛✙⛥⛤⛭⛯✥✤✦✠✫✬✭✰✱✻✼❀❂❃❄✷✴✛✙⛥⛤⛭⛯✥✤✦✠✫✬✭✰✱✻✼❀❂❃❄✷✴✛✙⛥⛤⛭⛯✥✤✦✠✫✬✭✰✱✻✼❀❂❃❄✷✴✛✙⛥⛤⛭⛯✥✤✦✠✫✬✭✰✱✻✼❃❄✷✴✛✙⛥⛤⛭⛯".blue.on_red.blink	
						counter = 0
						noagain = true
						if ((search_url == 1) && (page_number == page)) then
							cycle1 = true
							while cycle1 do
								puts "indique  el  numero de linea (1 al 7) a desplegar en el Navegador "	
								getline = gets.chomp.to_i
								if getline > 0 && getline < 8 then
								   cycle1 = false
								else
								   puts "Tiene que seleccionar un digito entre 1  y 7"
								end   
							end	
							posicion =  mostrar[getline-1]
							load_url = store[posicion][2]				
							system("clear")
							return load_url
						end	
						gets
						page_number += 1						
						system("clear")
				end		
			end	
		end	
  end
end
