require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def all
    @elements
  end

  def add(element)
    #set the id
    element.id = @next_id
    #add it to the array
    @elements << element
    #increment the id
    @next_id += 1
    #save csv
    save_csv
  end



  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      #convert my id into an integer
      parse_instance(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file,"wb") do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        store_instance(element,csv)
      end
    end
  end


end
