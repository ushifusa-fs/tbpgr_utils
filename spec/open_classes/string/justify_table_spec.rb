# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do

  context :justify_table do
    SAMPLE_TABLE = <<-EOS
|* first name|* family name|
|eiichiro|oda|
|akira|toriyama|
|yusei|matsui|
    EOS

    SAMPLE_NOT_TABLE = <<-EOS
csv_column1_1, csv_column1_2
csv_column2_1, csv_column2_2
    EOS

    SAMPLE_JUSTIFIED_TABLE = <<-EOS
|* first name|* family name|
|eiichiro    |oda          |
|akira       |toriyama     |
|yusei       |matsui       |
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'valid justify case',
        input: SAMPLE_TABLE,
        expected: SAMPLE_JUSTIFIED_TABLE,
      },
      {
        case_no: 2,
        case_title: 'not table case',
        input: SAMPLE_NOT_TABLE,
        expected: SAMPLE_NOT_TABLE,
      },
      {
        case_no: 3,
        case_title: 'empty case',
        input: '',
        expected: '',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].justify_table

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end