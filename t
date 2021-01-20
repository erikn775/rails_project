
[1mFrom:[0m /home/erikn775/rails_project/car_app/app/controllers/comments_controller.rb:10 CommentsController#create:

     [1;34m7[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m8[0m:     
     [1;34m9[0m:     @post = [1;34;4mPost[0m.find_by([35mid[0m: params[[33m:id[0m])
 => [1;34m10[0m:     binding.pry
    [1;34m11[0m:     @comment = [1;34;4mComment[0m.new([35mcontent[0m: params[[33m:post[0m][[33m:content[0m], [35muser_id[0m: current_user.id, [35mpost_id[0m: @post.id)
    [1;34m12[0m:     
    [1;34m13[0m:     [32mif[0m @comment.save
    [1;34m14[0m:         redirect_to post_path(@post)
    [1;34m15[0m:     [32melse[0m
    [1;34m16[0m:         flash.now[[33m:alert[0m] = [31m[1;31m"[0m[31mThere was a problem[1;31m"[0m[31m[0m
    [1;34m17[0m:     [32mend[0m
    [1;34m18[0m: [32mend[0m

