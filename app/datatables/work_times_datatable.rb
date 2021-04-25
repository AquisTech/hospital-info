class WorkTimesDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: 'WorkTime.id', orderable: true, searchable: true, cond: :eq },
      allocation_id: { source: 'WorkTime.allocation_id', orderable: true, searchable: true, cond: :like },
      work_date: { source: 'WorkTime.work_date', orderable: true, searchable: true, cond: :like },
      hours: { source: 'WorkTime.hours', orderable: true, searchable: true, cond: :like },
      minutes: { source: 'WorkTime.minutes', orderable: true, searchable: true, cond: :like },
      computed_hours: { source: 'WorkTime.computed_hours', orderable: true, searchable: true, cond: :like },
      status: { source: 'WorkTime.status', orderable: true, searchable: true, cond: :like },
      actions: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        allocation_id: record.allocation_id,
        work_date: record.work_date,
        hours: record.hours,
        minutes: record.minutes,
        computed_hours: record.computed_hours,
        status: record.status,
        actions: link_to_actions(record),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    WorkTime.all
  end

end