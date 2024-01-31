# Culinary Craft API

This Rails application serves as a simple recipe API, interacting with an external open API to provide recipe data in a cleaner and more organized format. The API consists of three endpoints:

## Usage

To download the project using git:
```bash
git clone git@github.com:CarlosCalgaro/CulinaryCraft.git
```

Install the project dependencies by running:
```bash
bundle install
```

## Run the Rails Server:
Start the Rails server:
```bash
rails server
```

You can now access the application at http://localhost:3000 in your web browser.

## Running the tests

Running Tests

```bash
rails test
```

## Endpoints

### 1. Categories Endpoint

Returns an array of recipe categories.

#### Endpoint

```bash
GET /api/categories
```

#### Response

```json
{
	"categories": [
		{
			"id": "1",
			"name": "Beef",
			"thumbnail": "https://www.themealdb.com/images/category/beef.png",
			"description": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
		},
    ...
  ]
}
```


### 2. Category Recipes Endpoint

Returns an array of recipes for a given category


#### Endpoint

```bash
GET /api/categories/:id/recipes
```

#### Response
```json
{
	"category": {
		"name": "beef",
		"recipes": [
			{
				"id": 52874,
				"name": "Beef and Mustard Pie",
				"thumbnail": "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
			},
    ]
  }
}
```

### 3. Recipe Endpoint

Returns information about the given recipe

#### Endpoint

```bash
GET /api/recipes/:id
```

#### Response
```json
{
  "recipe": {
      "id": 52874,
      "name": "Beef and Mustard Pie",
      "thumbnail": "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      "instructions": "Preheat the oven to 150C/300F/Gas ...",
      "drink_alternate": null,
      "area": "British",
      "tags": "Meat,\nPie",
      "source": "https://www.bbc.co.uk/food/recipes/beef_and_mustard_pie_58002",
      "image_source": null,
      "creative_commons_confirmed": null,
      "updated_at": null,
      "ingredients": [
        {
          "name": "Beef",
          "measure": "1kg"
        },
        ...
      ]
  }
}
```


