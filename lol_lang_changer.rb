require "yaml"

config = YAML::load_file("LeagueClientSettings.yaml")

config["install"]["globals"]["locale"] = "en_GB"

File.open('LeagueClientSettings.yaml', "w") do |file|
	YAML.dump(config, file)
end

puts config["install"]["globals"]["locale"]

a = gets.chomp

# .bat
# D:
# cd "Games\League of Legends\Config"

# ruby lol_lang_changer.rb
