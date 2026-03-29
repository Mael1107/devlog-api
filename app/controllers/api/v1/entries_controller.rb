class Api::V1::EntriesController < ApplicationController
  def index
    entries = Entry.all.includes(:tags)
    render json: entries, include: :tags
  end

  def show
    entry = Entry.find(params[:id])
    render json: entry, include: :tags
  end

  def update
    entry = Entry.find(params[:id])

    if entry.update(entry_params)
      render json: entry
    else
      render json: entry.errors, status: :unproccessable_entity
    end
  end

  def create
    entry = Entry.new(entry_params)

    if entry.save
      render json: entry, status: :created
    else
      render json: entry.errors, status: :unproccessable_entity
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    head :no_content
  end

  private 

  def entry_params
    params.require(:entry).permit(:title, :content, :date, tag_ids: [])
  end
end
