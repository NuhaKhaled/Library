class BooksController < ApplicationController
  # GET /books
  # GET /books.json

  def new
    @user = User.find(current_user.id)
  end

  def index
        @user = User.find(current_user.id)
       end

  def show
    @user = User.find(current_user.id)
    @book = @user.books.find(params[:id])

  end

    def create
    @user = User.find(current_user.id)
    @book = @user.books.create(params[:book])

     respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(user_books_path(current_user), :notice => 'book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action =>  "edit"  }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end



 def destroy
    @user = User.find(current_user.id)
    @book = @user.books.find(params[:id])
    @book.destroy
    redirect_to user_books_path(current_user)
  end

  def edit
     @user = User.find(current_user.id)
     @book = @user.books.find(params[:id])
end

def editAttr
       @user = User.find(current_user.id)
       @book = @user.books.find(params[:id])

  end




def update
     @user = User.find(current_user.id)
     @book = @user.books.find(params[:id])
   
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(user_books_path(current_user), :notice => 'book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end

end


end