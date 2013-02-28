require "data-table/version"
require "data-table/table"
require "data-table/column"

module DataTable
  def self.render(collection, &blk)
    # make a new table
    t = DataTable::Table.new(collection)

    # yield it to the block for configuration
    yield t

    # modify the data structure if necessary and do calculations
    t.prepare_data

    # render the table
    t.render
  end

  
  def self.default_css_styles
    <<-CSS_STYLE
      .data_table {width: 100%; empty-cells: show}
      .data_table td, .data_table th {padding: 3px}

      .data_table caption {font-size: 2em; font-weight: bold}

      .data_table thead {}
      .data_table thead th {background-color: #ddd; border-bottom: 1px solid #bbb;}

      .data_table tbody {}
      .data_table tbody tr.alt {background-color: #eee;}

      .data_table .group_header th {text-align: left;}

      .data_table .subtotal {}
      .data_table .subtotal td {border-top: 1px solid #000;}

      .data_table tfoot {}
      .data_table tfoot td {border-top: 1px solid #000;}

      .empty_data_table {text-align: center; background-color: #ffc;}

      /* Data Types */
      .data_table .number, .data_table .money {text-align: right}
      .data_table .text {text-align: left}
    CSS_STYLE
  end
end