defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    age(planet, seconds)
  end

  defp age_on_earth(seconds) do
    seconds / 31557600
  end

  defp age(:earth, seconds) do
    age_on_earth(seconds)
  end

  defp age(:mercury, seconds) do
    age_on_earth(seconds) / 0.2408467
  end
  
  defp age(:venus, seconds) do
    age_on_earth(seconds) / 0.61519726
  end

  defp age(:mars, seconds) do
    age_on_earth(seconds) / 1.8808158
  end

  defp age(:jupiter, seconds) do
    age_on_earth(seconds) / 11.862615
  end

  defp age(:saturn, seconds) do
    age_on_earth(seconds) / 29.447498
  end

  defp age(:uranus, seconds) do
    age_on_earth(seconds) / 84.016846
  end

  defp age(:neptune, seconds) do
    age_on_earth(seconds) / 164.79132
  end
end
