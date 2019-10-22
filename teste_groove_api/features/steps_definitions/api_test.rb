Dado("que informo o nome do diretor e produtor:") do |t_filmes|
  @d_filmes = t_filmes.rows_hash
end

Quando("faço uma chamada na API do swapi") do
  @return = HTTParty.get("#{CONFIG['url_default']}/films")
    if @return.code === 200
      @result = @return["results"]
      @result.each do |dados|
        puts dados["title"] if dados["director"] == @d_filmes["diretor"] && dados["producer"] == @d_filmes["produtor"]
      end
    else
      puts "Deu ruiiim!!  ¬_¬"
      puts @return.code, @return.message
    end 
end