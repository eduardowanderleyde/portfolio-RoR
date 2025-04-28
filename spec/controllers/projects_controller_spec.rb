require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns all projects to @projects' do
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested project to @project' do
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new project to @project' do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new project' do
        expect {
          post :create, params: { project: attributes_for(:project) }
        }.to change(Project, :count).by(1)
      end

      it 'redirects to the project' do
        post :create, params: { project: attributes_for(:project) }
        expect(response).to redirect_to(project_path(Project.last))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new project' do
        expect {
          post :create, params: { project: attributes_for(:project, title: nil) }
        }.not_to change(Project, :count)
      end

      it 're-renders the new template' do
        post :create, params: { project: attributes_for(:project, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested project to @project' do
      get :edit, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the project' do
        patch :update, params: { id: project.id, project: { title: 'New Title' } }
        project.reload
        expect(project.title).to eq('New Title')
      end

      it 'redirects to the project' do
        patch :update, params: { id: project.id, project: { title: 'New Title' } }
        expect(response).to redirect_to(project_path(project))
      end
    end

    context 'with invalid attributes' do
      it 'does not update the project' do
        patch :update, params: { id: project.id, project: { title: nil } }
        project.reload
        expect(project.title).not_to be_nil
      end

      it 're-renders the edit template' do
        patch :update, params: { id: project.id, project: { title: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the project' do
      project
      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(-1)
    end

    it 'redirects to projects index' do
      delete :destroy, params: { id: project.id }
      expect(response).to redirect_to(projects_path)
    end
  end
end 