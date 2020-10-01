class Job < ApplicationRecord
    belongs_to :level

    belongs_to :type_of_job
    belongs_to :experience_level
    has_many :candidate
    has_rich_text :descriptions
    has_rich_text :benifits
    has_rich_text :experience

    
    def self.select_job_to_view
        Job.joins(:level).joins(:type_of_job).select('jobs.*, levels.name as level, type_of_jobs.name as type')
        # connection.execute <<-SQL
        # select jobs.*, levels.name as level 
        # from jobs
        # INNER JOIN levels ON jobs.level_id = levels.id
        #  where jobs.status=true
        # SQL
        # Job.select("jobs.*, levels.name as level").join("INNER JOIN levels ON jobs.level_id=levels.id").where("status=?",true)
    end
    def self.select_candidate_of_job(job_id)
        # connection.execute <<-SQL
        #     select * from candidates
        #     INNER JOIN jobs ON candidates.job_id = jobs.id
        # SQL
     
        Candidate.joins(:job).select('candidates.*, jobs').where('candidates.job_id=?', job_id)
    end

    def delete_job
        if self.candidate.size!=0
            return false
        else 
            return true
        end 
    end

    def self.statistics_by_job
        self.select('id, name, views').order("views DESC")
    end
    
    def self.statistics_by_apply
        self.select('id, name, qty_apply').order('qty_apply DESC')
    end
    def self.statistics(job_id)
      
        self.select('name, views, qty_apply, (select count(*) as total from candidates 
        INNER JOIN jobs ON candidates.job_id = jobs.id and jobs.id = #{job_id} 
        where candidates.status=2 )').where('jobs.id=?',job_id)
    end

end
