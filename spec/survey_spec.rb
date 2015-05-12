require("spec_helper")

describe(Survey) do
  describe('#titlecase_name') do
    it("forces name to begin with a capital letter") do
      survey = Survey.create({:name => "survey"})
      expect(survey.name()).to(eq("Survey"))
    end
  end
end
