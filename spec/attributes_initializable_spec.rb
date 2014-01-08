# encoding: utf-8
require "spec_helper"
require "attributes_initializable"

describe AttributesInitializable do
  context :attr_accessor_init do
    class AccessorSample
      include AttributesInitializable
      attr_accessor_init :atr1, :atr2
    end

    cases = [
      {
        case_no: 1,
        case_title: "not block case",
        klass: AccessorSample,
        inputs: {
          atr1: 'atr1',
          atr2: 'atr2',
        },
        block: false,
        expected:  {
          atr1: 'atr1',
          atr2: 'atr2',
        },
      },
      {
        case_no: 2,
        case_title: "block case",
        klass: AccessorSample,
        inputs: {
          atr1: 'atr1',
          atr2: 'atr2',
        },
        block: true,
        expected:  {
          atr1: 'atr1',
          atr2: 'atr2',
        },
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          accessor_sample = nil
          if c[:block]
            accessor_sample = c[:klass].new do |a|
              a.atr1 = c[:inputs][:atr1]
              a.atr2 = c[:inputs][:atr2]
            end
          else
            accessor_sample = c[:klass].new :atr1 => 'atr1', :atr2 => 'atr2'
          end

          # -- then --
          c[:expected].each do |key, value|
            expect(accessor_sample.method(key).call).to eq(value)
          end
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
