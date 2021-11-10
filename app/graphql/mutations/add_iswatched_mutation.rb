module Mutations
    class AddIswatchedMutation < BaseMutation
        argument :film, ID, required: true
        field :errors,[String], null: false
        def resolve(film:)
            user = context[:current_user]
            film = FavoriteFilm.where(external_film_id:film)
            watched = FavoriteUserFilm.where(user_id:user.id,favorite_film_id:film[0].id)
            watched[0].is_watched = !watched[0].is_watched
            watched[0].save
            {
                errors:[]
            }
        end
    end 
end