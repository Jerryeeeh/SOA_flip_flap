# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n")
    heads = lines[0].split("\t")
    lines.shift
    @data = lines.map! { |x| Hash[heads.zip(x.split("\t"))] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = ''
    tsv << @data[0].keys.join("\t")
    tsv << "\n"
    @data.each do |x|
      tsv << x.values.join("\t")
      tsv << "\n"
    end
    tsv
  end
end
