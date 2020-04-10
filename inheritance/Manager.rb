class Manager < Employee
  def initialize(report_to_manager = [])
    @report_to_manager = report_to_manager
  end
end