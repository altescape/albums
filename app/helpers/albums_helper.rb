module AlbumsHelper

  def rdio_album
    if params[:s]
      search_term = params[:s]
    else
      search_term = ["Lenny Kravitz", "Jane's Addiction", "The Damned", "Weezer", "Eagles of Death Metal", "Band of Skulls", "The Shins", "Kasabian", "Dead Kennedys", "Buzzcocks"].sample
    end
    search_term
  end

end
