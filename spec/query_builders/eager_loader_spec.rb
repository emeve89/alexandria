require 'rails_helper'

RSpec.describe EagerLoader do
  let(:ruby_microscope) { create(:ruby_microscope) }
  let(:rails_tutorial) { create(:ruby_on_rails_tutorial) }
  let(:agile_web_dev) { create(:agile_web_development) }
  let(:books) { [ruby_microscope, rails_tutorial, agile_web_dev] }
  let(:scope) { Book.all }
  let(:params) { {'embed' => 'author', 'include' => 'publisher'} }
  let(:eager_load) { EagerLoader.new(scope, params) }
  let(:eager_loaded) { eager_load.load }

  before do
    allow(BookPresenter).to(
      receive(:relations).and_return(['author', 'publisher'])
    )
    books
  end

  describe '#load' do
    context 'without any parameters' do
      it 'returns the scope unchanged' do
        expect(eager_loaded).to eq scope
      end
    end
  end
end