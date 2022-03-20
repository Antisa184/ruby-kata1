require 'csv'
require 'pp'

class Library
  def initialize
    @readingMaterial = []
    @authors = []
  end

  def printAll(mode)
    material = @readingMaterial
    if mode==1 then material = material.sort{|a,b| a[0] <=> b[0] } end
    material.each do |entry|
      p entry[0]
      puts "Title: #{entry[0]}"
      puts "Isbn: #{entry[1]}"
      puts "Authors' email: #{entry[2].split(",").join(", ")}"
      #p entry[3]
      if entry[3].match(/\d{2}\.\d{2}\.\d{4}/) then puts "Published at: #{entry[3]}\n\n"
      else puts "\n#{entry[3]}\n\n" end
    end
  end

  def findByPhrase(phrase, num)
    found=0
    @readingMaterial.each do |material|
      if material[num].include?(phrase.strip) then
        found=1
        puts "\nHere you go!\n"
        puts "Title: #{material[0]}"
        puts "Isbn: #{material[1]}"
        puts "Authors' email: #{material[2].split(",").join(", ")}"
        if material[3].match(/\d{2}\.\d{2}\.\d{4}/) then puts "Published at: #{material[3]}\n\n"
        else puts "\n#{material[3]}\n\n" end
      end
    end
    if found==0 then puts "\nNot found!" end
  end
  def findByEmail
    puts "Please enter the Email: "
    email = gets
    findByPhrase(email.strip, 2)
  end
  def findByIsbn
    puts "Please enter the Isbn: "
    isbn = gets
    findByPhrase(isbn.strip, 1)
  end

  def loadCsv(path)
    fileArray = []
    Dir.chdir(path)
    Dir.entries(path).each{|i| fileArray << CSV.read(i) if File.extname(i)==".csv"}

    fileArray.each do |file|
      file.each_with_index do |entry, i|
        entry = entry.join(",")
        #p entry
        if i==0 then next end
        if file[0][0].end_with?("title;isbn;authors;description") || file[0][0].end_with?("title;isbn;authors;publishedAt")
          @readingMaterial << entry.split(";")
          #p entry

        elsif file[0][0].end_with?("﻿email;firstname;lastname")
          @authors << entry.split(";")
        end
      end
    end
    #pp @authors
    #pp @readingMaterial
  end
end
