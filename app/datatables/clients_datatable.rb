class ClientsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: 'Client.id', orderable: true, searchable: true, cond: :like },
      name: { source: 'Client.name', orderable: true, searchable: true, cond: :like },
      website: { source: 'Client.website', orderable: true, searchable: true, cond: :like },
      created_at: { source: 'Client.created_at', orderable: true, searchable: true, cond: :like },
      updated_at: { source: 'Client.updated_at', orderable: true, searchable: true, cond: :like },
      actions: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        website: record.website,
        created_at: record.created_at,
        updated_at: record.updated_at,
        actions: link_to_actions(record),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Client.all
  end

end