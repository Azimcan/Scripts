# Ubuntu icin arkaplan xml ciktisini alan program

uzanti = [".png", ".jpg"]


start_xml = "<background>
  <starttime>
    <year>2009</year>
    <month>08</month>
    <day>04</day>
    <hour>00</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
"
end_xml = "
</background>
"

images_ham = Dir.glob("*")
images = []

puts images_ham
images_ham.each do |img|
  images << img if uzanti.include?("#{img.match(/\.[\s0-9A-Za-z\W].*/)}".chomp)
end
puts images

file = File.new("ACK-BG.xml", "w")

file.write("#{start_xml}")
images.each_with_index do |img, i|

  xml = "
  <static>
    <duration>1795.0</duration>
    <file>#{Dir.pwd}/#{img}</file>
  </static>
  <transition>
    <duration>5.0</duration>
    <from>#{Dir.pwd}/#{img}</from>
    <to>#{Dir.pwd}/#{images[i+1] == nil ? images[0] : images[i+1]}</to>
  </transition>
  "

  file.write("#{xml}") 
end
file.write("#{end_xml}")

file.close