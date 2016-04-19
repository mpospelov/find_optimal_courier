class TripsQuery
  SELECT_BY_MONTH_QUERY = <<-SQL.squish.freeze
    EXTRACT(MONTH FROM start_date) = :month
    AND EXTRACT(YEAR FROM start_date) = :year
  SQL

  def initialize(scope, params)
    @scope = scope
    @params = params
  end

  def all
    filter_by_destination
    filter_by_starts_after
    filter_by_ends_before
    filter_by_selected_month
    @scope
  end

  private

  def filter_by_destination
    return if @params[:destination].blank?
    @scope = @scope.where('destination ILIKE ?', "%#{@params[:destination]}%")
  end

  def filter_by_starts_after
    return if @params[:starts_after].blank?
    @scope = @scope.where('start_date >= ?', @params[:starts_after])
  end

  def filter_by_ends_before
    return if @params[:ends_before].blank?
    @scope = @scope.where('end_date < ?', @params[:ends_before])
  end

  def filter_by_selected_month
    return if @params[:selected_month].blank?
    date = @params[:selected_month].to_date
    @scope = @scope.where(SELECT_BY_MONTH_QUERY, month: date.month, year: date.year)
  end
end
